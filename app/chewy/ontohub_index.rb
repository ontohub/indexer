class OntohubIndex < Chewy::Index
  define_type Repository do
    field :slug
    field :name
    field :description
    field :content_type
    field :remote_address
    field :remote_type
    field :created_at
    field :updated_at
  end
end
