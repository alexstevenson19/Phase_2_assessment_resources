class Post < ActiveRecord::Base
  validates_presence_of :body, :title

  def author_name=(name)
    (!name.kind_of?(String) || name.empty?) ? super("anonymous") : super(name)
  end
end
