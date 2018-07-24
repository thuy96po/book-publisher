require "rails_helper"

RSpec.describe Comment, type: :model do
  context "validation" do
    it{should validate_presence_of :content}
    it{should validate_length_of(:content).is_at_most(Settings.max_content)}
    it{should validate_presence_of :rate}
  end

  context "association" do
    it{should belong_to :user}
    it{should belong_to :book}
  end

  context "delegate" do
    it{should delegate_method(:email).to(:user).with_prefix}
  end

  describe ".order_created" do
    let!(:user){FactoryBot.create(:user)}
    let!(:author){FactoryBot.create(:author)}
    let!(:category){FactoryBot.create(:category)}
    let!(:book){FactoryBot.create(:book, author_id: author.id, category_id: category.id)}
    let!(:comment1){FactoryBot.create(:comment, user_id:user.id, book_id: book.id)}
    let!(:comment2){FactoryBot.create(:comment, user_id:user.id, book_id: book.id)}
    context "comment order by desc" do
      it{expect(Comment.order_created).to eq [comment2, comment1]}
    end
  end
end
