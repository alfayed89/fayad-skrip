class InternalController < ApplicationController
  before_filter do
    authenticate_karyawan!
  end
end