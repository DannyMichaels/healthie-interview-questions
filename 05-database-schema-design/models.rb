# Provider model with associations to clients and forms
class Provider < ApplicationRecord
  has_many :providers_clients
  has_many :clients, through: :providers_clients
  has_many :forms

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end

# Client model with associations to providers, journal entries, and form responses
class Client < ApplicationRecord
  has_many :providers_clients
  has_many :providers, through: :providers_clients
  has_many :journal_entries
  has_many :form_responses

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end

# Join model for providers and clients with an additional plan attribute
class ProvidersClient < ApplicationRecord
  belongs_to :provider
  belongs_to :client

  validates :plan, presence: true, inclusion: { in: %w[basic premium] }
end

# JournalEntry model associated with clients
class JournalEntry < ApplicationRecord
  belongs_to :client

  validates :content, presence: true

  # Default scope to order journal entries by creation date
  default_scope { order(created_at: :asc) }
end

# Form model associated with providers and form elements
class Form < ApplicationRecord
  belongs_to :provider
  has_many :form_elements
  has_many :form_responses

  validates :title, presence: true
end

# FormElement model associated with forms, supporting various element types
class FormElement < ApplicationRecord
  belongs_to :form

  validates :element_type, presence: true, inclusion: { in: %w[text select radio checkbox] }
  validates :label, presence: true
end

# FormResponse model associated with forms and clients
class FormResponse < ApplicationRecord
  belongs_to :form
  belongs_to :client
  has_many :form_answers
end

# FormAnswer model associated with form responses and form elements
class FormAnswer < ApplicationRecord
  belongs_to :form_response
  belongs_to :form_element

  validates :answer, presence: true
end
