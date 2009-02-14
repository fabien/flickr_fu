# wrapping class to hold a flickr photoset
# 
class Flickr::PhotoSets::PhotoSet
  attr_accessor :photoset_id, :primary, :secret, :server, :farm, :photos, :videos, :title, :description 
  
  def initialize(flickr, attributes)
    @flickr = flickr
    attributes.each do |k,v|
      send("#{k}=", v)
    end
  end
  
  def photos(options={})
    options.merge!(:extras => "license,date_upload,date_taken,owner_name,icon_server,original_format,last_update,geo,tags,machine_tags,o_dims,views,media")
    options.merge!(:photoset_id => photoset_id)
    
    rsp = @flickr.send_request('flickr.photosets.getPhotos', options)

    returning Flickr::Photos::PhotoResponse.new(:page => rsp.photoset[:page].to_i,
                                :pages => rsp.photoset[:pages].to_i,
                                :per_page => rsp.photoset[:perpage].to_i,
                                :total => rsp.photoset[:total].to_i,
                                :photos => [],
                                :api => self,
                                :method => 'photos',
                                :options => options) do |photos|
      rsp.photoset.photo.each do |photo|
        attributes = Flickr::Photos.create_attributes(photo)
        photos << Flickr::Photos::Photo.new(@flickr, attributes)
      end if rsp.photoset.photo
    end
  end
  
end