class ComparisonMenu
  def menu_selection
    prompt = TTY::Prompt.new
    puts 'Welcome to the Comparison App'.colorize(:blue)
    prompt.select('Please make a selection from the below'.colorize(:blue)) do |menu|
      menu.choice({ name: 'Upload CSV', value: '1' })
      menu.choice({ name: 'Enter user data', value: '2' })
      menu.choice({ name: 'Compare databases', value: '3' })
      menu.choice({ name: 'View comparison', value: '4' })
      menu.choice({ name: 'Exit', value: '5' })
    end
  end

  def router(comparison_app)
    loop do
      case menu_selection
      when '1'
        comparison_app.import_csv
      when '2'
        comparison_app.enter_user_data
      when '3'
        comparison_app.compare_method
      when '4'
        comparison_app.display_data
      when '5'
        exit
      end
    end
  end
end
