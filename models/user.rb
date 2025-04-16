require_relative '../config/database'

class User < Sequel::Model
  plugin :timestamps # Automatically handle created_at and updated_at

  # Validations
  def validate
    super
    errors.add(:name, 'cannot be empty') if !name || name.empty?
    errors.add(:email, 'cannot be empty') if !email || email.empty?
    errors.add(:email, 'is invalid') unless email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  end

  # Class methods for creating and deleting users
  class << self
    def create_user(name:, email:)
      create(name: name, email: email)
    rescue Sequel::ValidationFailed => e
      { error: e.message }
    rescue Sequel::UniqueConstraintViolation
      { error: 'Email already exists' }
    end

    def delete_user(id)
      user = find(id: id)
      return { error: 'User not found' } unless user
      
      user.delete
      { success: true, message: 'User deleted successfully' }
    rescue => e
      { error: e.message }
    end
  end
end 