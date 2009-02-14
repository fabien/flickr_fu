class Flickr::PhotoSets < Flickr::Base
  
  def initialize(flickr)
    @flickr = flickr
  end

  def get_info(photoset_id, options = {})
    rsp = @flickr.send_request('flickr.photosets.getInfo', options.merge(:photoset_id => photoset_id))
    attributes = create_attributes(rsp.photoset)
    PhotoSet.new(@flickr, attributes)
  end
  
  def get_photos(photoset_id, options = {})
    photoset = PhotoSet.new(@flickr, :photoset_id => photoset_id)
    photoset.photos
  end

  # Get the photosets list.
  # 
  def get_list(options={})
    rsp = @flickr.send_request('flickr.photosets.getList', options)
    collect_sets(rsp)
  end

  protected
  
  def collect_sets(rsp)
    photosets = []
    return photosets unless rsp
    if rsp.photosets.photoset
      rsp.photosets.photoset.each do |photoset|
        attributes = create_attributes(photoset)
        photosets << PhotoSet.new(@flickr, attributes)
      end
    end
    return photosets
  end
   
  def create_attributes(set)
    {
      :photoset_id  => set[:id], 
      :primary      => set[:primary],
      :secret       => set[:secret],
      :server       => set[:server],
      :farm         => set[:farm],
      :photos       => set[:photos],
      :videos       => set[:videos],
      :title        => set.title.to_s,
      :description  => set.description.to_s
    }
  end  
  
end