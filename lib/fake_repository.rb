require 'faker'

##
# This is a class that generates fake repositories in the format we expect from
# Github. It's used by the db/seeds.rb file and the specs for this app. If you
# want populate your development database with useful dummy data, do "rake db:seed"
#
# If you want to create a Repository model from this class, simply do...
#
#   fake_push = FakeRepository.new
#   Repository.update_or_create_from_github_push fake_push.repository_metadata
#
class FakeRepository

  GITHUB_DATE_FORMAT = "%Y-%m-%dT%H:%M:%S-08:00"

  ROOT_PATH = File.expand_path(RAILS_ROOT)

  SAMPLE_FILES = Dir["#{ROOT_PATH}/**/*"].map do |filename|
    File.expand_path(filename).sub(ROOT_PATH, "")[1..-1]
  end

  def sha
    @sha ||= random_sha
  end

  def repository_metadata
    @repository ||= {
            "before" => repository_commit_before,
            "after" => repository_commit_after,
            "ref" => "refs/heads/master",
            "repository" => {
                    "url" => "http://github.com/#{owner_username}/#{repository_name}",
                    "name" => repository_name,
                    "description" => description,
                    "watchers" => watchers,
                    "forks" => forks,
                    "private" => private?,
                    "owner" => owner_metadata,
            },
            "commits" => commits
    }
  end

  def repository_commit_before
    @repository_commit_before ||= random_sha
  end

  def repository_commit_after
    @repository_commit_after ||= random_sha
  end

  def description
    @description ||= Faker::Company.catch_phrase
  end

  def owner_metadata
    @owner_metadata ||= {
            "owner" => {
                    "email"  => owner_email,
                    "name" => owner_name
            }
    }
  end

  def owner_email
    @owner_email ||= Faker::Internet.email
  end

  def owner_name
    @owner_name ||= Faker::Name.name
  end

  def owner_username
    @owner_username ||= Faker::Internet.user_name[/\w+/]
  end

  def private?
    @private ||= rand(1) == 0
  end

  def watchers
    @watchers ||= rand(100)
  end

  def forks
    @forks ||= rand(20)
  end

  def repository_name
    @repository_name ||= Faker::Lorem.words.first
  end

  def qualified_github_name
    "#{owner_username}/#{repository_name}"
  end

  def commits
    @commits ||= Array.new(rand(10)+1) do |index|
      sha = random_sha
      time_offset = rand 50
      {
              "id" => sha,
              "url" => "http://github.com/#{owner_username}/#{repository_name}/commit/#{sha}",
              "message" => Faker::Company.bs,
              "timestamp" => (time_offset - index).days.ago.strftime(GITHUB_DATE_FORMAT),
              "added" => rand(4) == 0 ? SAMPLE_FILES.shuffle[0, rand(10)] : []
      }.merge(owner_metadata)
    end
  end

  private


  def random_sha
    Digest::SHA1.hexdigest(rand.to_s)
  end

end