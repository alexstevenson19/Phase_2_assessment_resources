Useful ruby

migrations

class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, {null: false, unique: true}
      t.string :email,  {null: false}
      t.string :encrypted_password, {null: false}
      t.string :avatar

      t.timestamps(null: false)
    end
  end
end


# don't forget to gem 'bcrypt' and other gems if you are getting errors
# also don't forget it is encrypted_password (hashed...) in the migration, but when you make a new user in console, table or seed file, call the 'password' writer and reader method.
gem 'rake'
gem 'bcrypt'
gem 'shotgun'
#Password Encryption ======================================================

require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :positions
  belongs_to :house
  has_many :entry_tags
  has_many :tags through: :entry_tag

  validates :title, { :presence => true, :uniqueness => true }


  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end

  def authenticate(email, password)
    self.email == email && self.password == password
  end

end


#login/register/ etc header for layout.erb =================
# don't forget to add user id to session in controller
#     session[:user_id] = @user.id
<header>
  <div id="login">
    <nav>
      <!-- if session[:user_id]? -->
      <% if session[:user_id] %>
      <%= @user = User.find(session[:user_id]) %>
      <ul>
        <li><a href="/users/:id"><%= @user.username %></a></li>
        <li><a href="/logout">logout</a></li>
        <li><a href="/">home</a></li>
      </ul>
      <% else %>
      <ul>
        <li><a href="/registration">register</a></li>
        <li><a href="/login">login</a></li>
        <li><a href="/">home</a></li>
      </ul>
      <% end %>
    </nav>
  </div>
    <%= session.inspect %>
</header>
