SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|
    primary.item :key_1, 'Dashboard', admin_path do |sub_nav|
        sub_nav.item :key_1_1, 'A', nil
        sub_nav.item :key_1_2, 'B', nil
        sub_nav.item :key_1_3, 'C', nil
        sub_nav.item :key_1_4, 'D', nil
        sub_nav.item :key_1_5, 'E', nil 
    end
    
    primary.item :key_2, 'Users &  Content', admin_users_path do |sub_nav|
        sub_nav.item :key_2_1, 'Users', admin_users_path
        sub_nav.item :key_2_2, 'Green', nil
        sub_nav.item :key_2_3, 'Yellow', nil
        sub_nav.item :key_2_4, 'Blue', nil
        sub_nav.item :key_2_5, 'Orange', nil
    end
    
    primary.item :key_3, 'Settings', nil do |sub_nav|
        sub_nav.item :key_3_1, 'Warrior', nil
        sub_nav.item :key_3_2, 'Priest', nil
        sub_nav.item :key_3_3, 'Tank', nil
        sub_nav.item :key_3_4, 'Mage', nil
        sub_nav.item :key_3_5, 'Bard', nil
    end
    
    primary.item :key_4, 'Visuals', nil do |sub_nav|
        sub_nav.item :key_4_1, 'Square', nil
        sub_nav.item :key_4_2, 'Circle', nil
        sub_nav.item :key_4_3, 'Rectangle', nil
        sub_nav.item :key_4_4, 'Triangle', nil
        sub_nav.item :key_4_5, 'Octogon', nil
    
    end
    
    primary.item :key_5, 'Configuration', nil do |sub_nav|
        sub_nav.item :key_5_1, 'A Setting', nil
        sub_nav.item :key_5_2, 'A Slider', nil
        sub_nav.item :key_5_3, 'A Control', nil
        sub_nav.item :key_5_4, 'A Widget', nil
        sub_nav.item :key_5_5, 'A Button', nil
    end
    
  end

end