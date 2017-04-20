require 'spec_helper'

describe server(:db) do
  describe mysql_query('SHOW STATUS') do
    it 'responds uptime' do
      row = results.find {|r| r['Variable_name'] == 'Uptime' }
      expect(row['Value'].to_i).to be > 0
    end
  end

  describe mysql_query('SELECT User, Host FROM mysql.user WHERE User=? AND Host=?', 'app', '%') do
    it 'binds arguments to query' do
      row = results.first
      expect(row['User']).to eq 'app'
      expect(row['Host']).to eq '%'
    end
  end
end

describe server(:db_database_name) do
  describe mysql_query('SELECT User, Host FROM user WHERE User=? AND Host=?', 'app', '%') do
    it 'binds arguments to query' do
      row = results.first
      expect(row['User']).to eq 'app'
      expect(row['Host']).to eq '%'
    end
  end
end
