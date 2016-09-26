class Attack

  Black_lists = %w(click.php kvcollect)

  def initialize(app, message="Response time")
    @app = app
    @message = message
  end

  def call(env)
    # binding.pry
    http_path = env["REQUEST_PATH"].downcase
    if Black_lists.any?{ |black| http_path.include? black }
      [404, {"Content-Type" => "text/html"}, ["WTF"]]
    else
      status, headers, @response = @app.call(env)
      [status, headers, self]
    end
  end

  def each(&block)
    # block.call("<!-- #{@message}: #{@stop - @start} -->\n") if @headers["Content-Type"].include? "text/html"
    @response.each(&block)
  end

end
