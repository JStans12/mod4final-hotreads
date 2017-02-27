require 'rails_helper'

describe "a user navigates to the index" do
  it "they see a list of the reads in the correct order" do
    read1, read2, read3 = create_list(:read, 3)
    create(:read, url: read2.url)
    create(:read, url: read2.url)
    create(:read, url: read3.url)

    visit '/'

    within('#hot-reads') do
      page.body.index(read2.url).should < page.body.index(read3.url)
      page.body.index(read3.url).should < page.body.index(read1.url)
    end
  end

  it "there are no more than 10 reads" do
    create_list(:read, 11)

    visit '/'

    expect(page).to have_selector('li', count: 10)
  end
end
