module ProblemsHelper
  def decorate_accuracy(acc)
    color = case acc
            when 0.0...20.0
              "#c82f24"
            when 20.0...40.0
              "#d77612"
            when 40.0...60.0
              "#e6c100"
            when 60.0...80.0
              "#84a620"
            else
              "#228a39"
            end
    %Q{<span style="color: #{color}">#{ acc }</span>}
  end
end
