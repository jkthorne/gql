class GQL::Base
  getter :io

  def initialize
    @io = String::Builder.new
  end

  def build
    @io << " }"
    io.to_s
  end

  def dots
    io << "..."
  end

  macro method_missing(call, **kargs)
    m_name = {{ call.name.stringify }}

    if m_name.starts_with?("dots_")
      io << "..." << m_name[5..-1] << ' '
    elsif m_name.starts_with?("on_")
      io << "...on " << m_name[3..-1] << ' '
    elsif m_name.starts_with?("at_")
      io << '@' << m_name[3..-1]
    elsif m_name.ends_with?("_path")
      io << ' ' << m_name[0..-6].gsub('_', ':')
    else
      io << ' ' << m_name
    end

    {% if call.named_args && 0 < call.named_args.size %}
      n_args = {} of String => String?

      {% for narg, i in call.named_args %}
        n_args[{{narg.name.stringify}}] = {{narg.name}}.to_s
      {% end %}

      io << '(' << n_args.map{ |k, v| "#{k}: #{v}" }.join(", ") << ')'
    {% elsif 1 == call.args.size %}
      io << ": " << {{ call.args.first }}
    {% elsif 1 < call.args.size %}
      io << {{ call.args }}.map{ |a| "(#{a}: $#{a})" }.join(", ")
    {% end %}

    {% if call.block %}
      io << " { "
      yield
      io << " }"
    {% end %}

    nil
  end
end
