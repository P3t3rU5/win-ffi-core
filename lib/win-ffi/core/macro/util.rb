module WinFFI
  def makeword(a, b)
    ((a & 0xff) | ((b & 0xff) << 8))
  end

  def makelong(a, b)
    ((a & 0xffff) | ((b & 0xffff) << 16))
  end

  def loword(l)
    l & 0xffff
  end

  def hiword(l)
    l >> 16
  end

  def lobyte(w)
    w & 0xff
  end

  def hibyte(w)
    w >> 8
  end

  def points_to_point(pt, pts)
    pt.x = loword(pts)
    pt.y = hiword(pts)
  end

  def point_to_points(pt)
    makelong(pt.x, pt.y)
  end

  alias_method :makelresult, :makelong
  alias_method :makelparam,  :makelong
  alias_method :makewparam,  :makelong
end