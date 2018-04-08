module Blog::Archive::Components
  MONTH_NAMES = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  private def render_activity(posts)
    activity = build_activity(posts)
    max_posts_in_one_month = max_posts_in_month(activity)

    table do
      tr do
        activity.each do |year, post_counts|
          td colspan: post_counts.size.to_s, class: "start_of_year" do
            text year
          end
        end
      end
      tr do
        activity.each do |year, post_counts|
          start_of_year = true
          post_counts.each_with_index do |count, index|
            classes = scale_for_count(count, max_posts_in_one_month)
            classes += " start_of_year" if start_of_year
            td class: classes do
              span class: "month-name" do
                text MONTH_NAMES[index]
              end
            end
            start_of_year = false
          end
        end
      end
    end
  end

  private def scale_for_count(count, max)
    case count.to_f/max.to_f
    when 0 then "default"
    when 0..0.3 then "few"
    when 0.3..0.6 then "many"
    when 0.6..1 then "most"
    else "default"
    end
  end

  private def build_activity(posts)
    years = posts.map { |post| post.published_at.year }.uniq.sort
    activity = Hash.zip(years, years.map { Array.new(12, 0) })

    posts.each do |post|
      activity[post.published_at.year][post.published_at.month - 1] += 1
    end
    activity
  end

  private def max_posts_in_month(activity)
    activity.values.flatten.max
  end
end
