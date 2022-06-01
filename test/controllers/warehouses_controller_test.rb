require "test_helper"

class WarehousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warehouse = warehouses(:one)
  end

  test "should get index" do
    get warehouses_url
    assert_response :success
  end

  test "should get new" do
    get new_warehouse_url
    assert_response :success
  end

  test "should create warehouse" do
    assert_difference('Warehouse.count') do
      post warehouses_url, params: { warehouse: { address1: @warehouse.address1, address2: @warehouse.address2, city: @warehouse.city, name: @warehouse.name, postalcode: @warehouse.postalcode, prov: @warehouse.prov } }
    end

    assert_redirected_to warehouse_url(Warehouse.last)
  end

  test "should show warehouse" do
    get warehouse_url(@warehouse)
    assert_response :success
  end

  test "should get edit" do
    get edit_warehouse_url(@warehouse)
    assert_response :success
  end

  test "should update warehouse" do
    patch warehouse_url(@warehouse), params: { warehouse: { address1: @warehouse.address1, address2: @warehouse.address2, city: @warehouse.city, name: @warehouse.name, postalcode: @warehouse.postalcode, prov: @warehouse.prov } }
    assert_redirected_to warehouse_url(@warehouse)
  end

  test "should destroy warehouse" do
    assert_difference('Warehouse.count', -1) do
      delete warehouse_url(@warehouse)
    end

    assert_redirected_to warehouses_url
  end
end
