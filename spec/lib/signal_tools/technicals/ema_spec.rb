require_relative '../../../yquotes_spec_helper'

describe YquotesSignalTools::Technicals::EMA do
  before(:each) do
    allow_any_instance_of(YquotesSignalTools::StockData).to receive(:get_quote).and_return(data_for_tests(ticker))
    @stock = YquotesSignalTools::Stock.new(ticker)
    @close_prices = @stock.stock_data.close_prices
  end

  it 'should calculate ema' do
    expect("90.178955").to eq("%.6f" % YquotesSignalTools::Technicals::EMA.new(@close_prices, 10, :default).calculate[-1])
    expect("88.592900").to eq("%.6f" % YquotesSignalTools::Technicals::EMA.new(@close_prices, 10, :default).calculate[-5])
    expect("88.226194").to eq("%.6f" % YquotesSignalTools::Technicals::EMA.new(@close_prices, 25, :default).calculate[-1])
    expect("87.032824").to eq("%.6f" % YquotesSignalTools::Technicals::EMA.new(@close_prices, 25, :default).calculate[-5])
  end
end