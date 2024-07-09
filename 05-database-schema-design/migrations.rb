# Create the providers table with columns for name and email
class CreateProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :providers do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }

      t.timestamps
    end
  end
end

# Create the clients table with columns for name and email
class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }

      t.timestamps
    end
  end
end

# Create the join table for providers and clients with an additional plan column
class CreateProvidersClients < ActiveRecord::Migration[7.1]
  def change
    create_table :providers_clients do |t|
      t.references :provider, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.string :plan, null: false

      t.timestamps
    end
  end
end

# Create the journal_entries table with a reference to clients and a content column
class CreateJournalEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :journal_entries do |t|
      t.references :client, null: false, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end

# Create the forms table with a reference to providers and a title column
class CreateForms < ActiveRecord::Migration[7.1]
  def change
    create_table :forms do |t|
      t.references :provider, null: false, foreign_key: true
      t.string :title, null: false

      t.timestamps
    end
  end
end

# Create the form_elements table with a reference to forms, element type, label, and options columns
class CreateFormElements < ActiveRecord::Migration[7.1]
  def change
    create_table :form_elements do |t|
      t.references :form, null: false, foreign_key: true
      t.string :element_type, null: false
      t.string :label, null: false
      t.text :options

      t.timestamps
    end
  end
end

# Create the form_responses table with references to forms and clients
class CreateFormResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :form_responses do |t|
      t.references :form, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end

# Create the form_answers table with references to form_responses and form_elements, and an answer column
class CreateFormAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :form_answers do |t|
      t.references :form_response, null: false, foreign_key: true
      t.references :form_element, null: false, foreign_key: true
      t.text :answer, null: false

      t.timestamps
    end
  end
end
