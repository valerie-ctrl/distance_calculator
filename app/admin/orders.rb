ActiveAdmin.register Order do

    actions :index

    permit_params :weight, :height, :length, :width, :origin, :destination, :price

end
