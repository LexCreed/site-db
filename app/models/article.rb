class Article < ActiveRecord::Base
    include AASM
    
    belongs_to :user
    has_many :comments
    
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true, length: { minimum: 20}
    
    has_attached_file :cover, styles: {thumb:"800x600", mini:"400x200"}
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
    
    scope :publicados, -> { where(state: "published")}
    scope :ultimos, ->{order("created_at DESC")}
    
    aasm column: "state" do
        state :in_draft, initial: true
        state :published

        event :publish do
            transitions from: :in_draft, to: :published
        end
        
        event :unpublish do
            transitions from: :published, to: :in_draft
        end
    end
end
