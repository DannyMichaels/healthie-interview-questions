## EXAMPLE QUERIES\

provider_id = 1
client_id = 1

# 1. find all clients for a particular provider
provider = Provider.find(provider_id)
clients = provider.clients

# 2. Find all providers for a particular client:
client = Client.find(client_id)
providers = client.providers


# 3. Find all of a particular client's journal entries, sorted by date posted:
client = Client.find(client_id)
journal_entries = client.journal_entries.order(created_at: :asc)


# 4. Find all of the journal entries of all of the clients of a particular provider, sorted by date posted:
provider = Provider.find(provider_id)
journal_entries = JournalEntry.joins(client: :providers_clients)
                              .where(providers_clients: { provider_id: provider.id })
                              .order(created_at: :asc)
