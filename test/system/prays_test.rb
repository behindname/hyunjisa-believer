require "application_system_test_case"

class PraysTest < ApplicationSystemTestCase
  setup do
    @pray = prays(:one)
  end

  test "visiting the index" do
    visit prays_url
    assert_selector "h1", text: "Prays"
  end

  test "creating a Pray" do
    visit prays_url
    click_on "New Pray"

    fill_in "Believer", with: @pray.believer_id
    fill_in "Buddha", with: @pray.buddha_id
    fill_in "Donator", with: @pray.donator
    fill_in "Finishday", with: @pray.finishDay
    fill_in "Fullpayday", with: @pray.fullPayDay
    check "Isfinishconfirmed" if @pray.isFinishConfirmed
    check "Isprayfinished" if @pray.isPrayFinished
    fill_in "Prayeraddress", with: @pray.prayerAddress
    fill_in "Prayerbirthyear", with: @pray.prayerBirthyear
    fill_in "Prayername", with: @pray.prayerName
    fill_in "Prayerphone", with: @pray.prayerPhone
    fill_in "Prayerrelation", with: @pray.prayerRelation
    fill_in "Remarks", with: @pray.remarks
    fill_in "Startday", with: @pray.startDay
    fill_in "Temple", with: @pray.temple_id
    click_on "Create Pray"

    assert_text "Pray was successfully created"
    click_on "Back"
  end

  test "updating a Pray" do
    visit prays_url
    click_on "Edit", match: :first

    fill_in "Believer", with: @pray.believer_id
    fill_in "Buddha", with: @pray.buddha_id
    fill_in "Donator", with: @pray.donator
    fill_in "Finishday", with: @pray.finishDay
    fill_in "Fullpayday", with: @pray.fullPayDay
    check "Isfinishconfirmed" if @pray.isFinishConfirmed
    check "Isprayfinished" if @pray.isPrayFinished
    fill_in "Prayeraddress", with: @pray.prayerAddress
    fill_in "Prayerbirthyear", with: @pray.prayerBirthyear
    fill_in "Prayername", with: @pray.prayerName
    fill_in "Prayerphone", with: @pray.prayerPhone
    fill_in "Prayerrelation", with: @pray.prayerRelation
    fill_in "Remarks", with: @pray.remarks
    fill_in "Startday", with: @pray.startDay
    fill_in "Temple", with: @pray.temple_id
    click_on "Update Pray"

    assert_text "Pray was successfully updated"
    click_on "Back"
  end

  test "destroying a Pray" do
    visit prays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pray was successfully destroyed"
  end
end
