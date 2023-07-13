RSpec.describe Api::V1::LibrariesController, type: :controller do
  describe 'GET #books' do
    let(:library) { create(:library) }
    let(:book1) { create(:book, library: library) }
    let(:book2) { create(:book, library: library, checked_out: true, user: create(:user)) }

    before do
      get :books, params: { library_id: library.id }
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the correct library name' do
      json_response = JSON.parse(response.body)
      expect(json_response['library']).to eq(library.name)
    end

    it 'returns the correct number of books' do
      json_response = JSON.parse(response.body)
      expect(json_response['books'].count).to eq(2)
    end

    it 'returns the correct book details' do
      json_response = JSON.parse(response.body)
      expect(json_response['books'][0]['id']).to eq(book1.id)
      expect(json_response['books'][0]['status']).to eq('available')
      expect(json_response['books'][1]['id']).to eq(book2.id)
      expect(json_response['books'][1]['status']).to eq('checked_out')
      expect(json_response['books'][1]['checked_out_by']).to eq(book2.user.name)
    end
  end
end
