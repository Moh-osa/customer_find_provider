# frozen_string_literal: true

class EnableExtensions < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'cube'
    enable_extension 'earthdistance'
  end
end
