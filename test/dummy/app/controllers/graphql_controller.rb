class GraphqlController < ApplicationController

  def index
    render json: GraphSchema.execute(GraphQL::Introspection::INTROSPECTION_QUERY)
  end

  def create
    render json: GraphSchema.execute(
        params[:query],
        variables: params[:variables] || {},
        context: {current_user: current_user, test_key: params[:test_key]}
    )
  end

  private
  def current_user
    'me!'
  end

end
