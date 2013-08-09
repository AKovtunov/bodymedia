def behaves_like_hash response
    expect(response).not_to be_nil
    expect(response).to be_kind_of (Hash)
end