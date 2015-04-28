package :imagemagick do
  description "ImageMagick"
  version '6.9.1-2'

  source "http://www.imagemagick.org/download/ImageMagick-#{version}.tar.gz" do
    prefix '/usr'
    disable %w(static openmp)
    enable 'shared'
    with %w(modules quantum-depth=8)
    without %w(perl magick-plus-plus)
  end

  verify do
    has_executable 'convert'
  end

  requires :imagemagick_dependencies
end

package :imagemagick_dependencies do
  apt 'libpng12-dev'
  apt 'libtool'
  requires :libjpeg
end

package :libjpeg do
  version '7'
  source "http://www.ijg.org/files/jpegsrc.v#{version}.tar.gz" do
    custom_dir 'jpeg-7'
    prefix '/usr'
    enable 'shared'
  end

  verify do
    has_file '/usr/lib/libjpeg.so.7'
  end
end
