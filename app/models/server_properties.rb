class ServerProperties < ActiveRecord::Base
  belongs_to :server

  def create_file
    file_path = Rails.root.join('tmp', "#{self.class.name}-#{Time.now.to_f}")
    File.open(file_path, 'w') do |file|
      santised_attributes.each do |key, value|
        file.write "#{key.dasherize}=#{value}\r\n"
      end
    end
    file_path
  end

  private
  def santised_attributes
    attributes_to_write = self.attributes
    attributes_to_write.delete('server_id')
    attributes_to_write.delete('created_at')
    attributes_to_write.delete('updated_at')
    attributes_to_write
  end

end
