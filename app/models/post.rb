class Post < ActiveRecord::Base

	acts_as_votable
	
  belongs_to :user
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments

  has_attached_file :attachment,
    styles: lambda { |a| a.instance.is_image? ? {:small => "x200>", :medium => "x300>", :large => "x400>"}  : {:thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10}, :medium => { :geometry => "300x300#", :format => 'jpg', :time => 10}}},
    processors: lambda { |a| a.video? ? [ :ffmpeg ] : [ :thumbnail ] }

  validates_attachment_content_type :attachment, :content_type => /\A(image|video)\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :attachment, :less_than => 200.megabytes

   def video?
    [ 'application/x-mp4',
      'video/mpeg',
      'video/quicktime',
      'video/x-la-asf',
      'video/x-ms-asf',
      'video/x-msvideo',
      'video/x-sgi-movie',
      'video/x-flv',
      'flv-application/octet-stream',
      'video/3gpp',
      'video/3gpp2',
      'video/3gpp-tt',
      'video/BMPEG',
      'video/BT656',
      'video/CelB',
      'video/DV',
      'video/H261',
      'video/H263',
      'video/H263-1998',
      'video/H263-2000',
      'video/H264',
      'video/JPEG',
      'video/MJ2',
      'video/MP1S',
      'video/MP2P',
      'video/MP2T',
      'video/mp4',
      'video/MP4V-ES',
      'video/MPV',
      'video/mpeg4',
      'video/mpeg4-generic',
      'video/nv',
      'video/parityfec',
      'video/pointer',
      'video/raw',
      'video/rtx' ].include?(attachment.content_type)
  end

  def is_image?
  	['image/jpg',
  	'image/png',
  	'image/gif'].include?(attachment.content_type)
  	
  end

end
