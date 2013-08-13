require 'erb'
require_relative 'params'
require_relative 'session'
require 'active_support/core_ext'

class ControllerBase
  attr_reader :params

  def initialize(req, res, route_params = nil)
    @req, @res = req, res
  end

  def session
    @session ||= Session.new(@req)
  end

  def params
    @params = Params.new(@req, nil)
  end

  def already_rendered?
  end

  def redirect_to(url)
    # @res.status = 302
    # @res.header['location'] = url.to_s

    # Above is roughly equivalent to below:
    @res.set_redirect(WEBrick::HTTPStatus[302], url)
    session.store_session(@res)

    @already_built = true
  end

  def render_content(content, type)
    @res.content_type = type
    @res.body = content
    session.store_session(@res)

    @already_built = true
  end

  def render(template_name)
    controller_name = self.class.to_s.underscore

    template = File.read("views/#{controller_name}/#{template_name}.html.erb")

    content = ERB.new(template).result(binding)
    render_content(content, 'text/text')
  end

  def invoke_action(name)
  end
end
