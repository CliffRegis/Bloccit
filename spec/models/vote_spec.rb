describe Vote do
  describe "validation" do
    
    describe "value_validation" do
      it 'only allows -1 or 1 as values' do
        expect(Vote.new(true).value_validation?).to eq(1)
        expect(Vote.new(false).value_validation?).to eq(-1)
      end
    end
  end
end