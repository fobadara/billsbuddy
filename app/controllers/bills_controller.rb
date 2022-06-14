class BillsController < ApplicationController
  # before_action :set_bill, only: %i[ show edit destroy new create ]
  before_action :authenticate_user!
  # load_and_authorize_resource :group

  # GET /bills or /bills.json
  def index
    @bills = Bill.all
  end

  # # GET /bills/1 or /bills/1.json
  def show
    @group = Group.find(params[:group_id])
    @bills = @group.bills
  end

  # GET /bills/new
  def new
    @bill = Bill.new
    @categories = Group.all
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @categories = Group.all
    @bill = Bill.new(bill_params)
    @user_id = current_user.id

    if @bill.save
      group_bill = @group.group_bills.new(bill: @bill)
      # OR category_record = CategoryRecord.create!(category: @category, record: @record)
      group_bill.save
      redirect_to group_path(@group), notice: 'Bill was successfully created.'
    else
      render :new
    end
  end

  # GET /bills/1/edit
  def edit
    @group = Group.find(params[:group_id])
    @bill = @group.bills.find(params[:id])
  end

  # DELETE /bills/1 or /bills/1.json
  def destroy
    @group = Group.find(params[:group_id])
    @bill = @group.bills.find(params[:id])
    if @bill.destroy
      redirect_to group_path(@group), notice: 'Bill was successfully destroyed.'
    else
      redirect_to group_path(@group), alert: 'Bill was not destroyed.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bill
    # @bill = Bill.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bill_params
    params.require(:bill).permit(:name, :amount, :description, :due_date, :category).merge(user_id: current_user.id)
  end
end
