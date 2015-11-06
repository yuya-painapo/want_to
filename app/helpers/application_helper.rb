module ApplicationHelper
  def vpos_to_h_mm_ss(vpos)
    sec = vpos / 100
    m, ss = sec.divmod(60)
    h, mm = m.divmod(60)
    format("%d:%02d:%02d", h, mm, ss)
  end
end
