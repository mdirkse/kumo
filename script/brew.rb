class Kumo < Formula
  desc "Kumo: Word Clouds in Java"
  homepage "https://github.com/kennycason/kumo"
  url "http://search.maven.org/remotecontent?filepath=com/kennycason/kumo/1.6/kumo-1.6.jar"
  sha256 "<TO_ADD>"

  def install
    libexec.install "kumo-1.6.jar"
    bin.write_jar_script libexec/"kumo-1.6.jar", "kumo"
    puts "Finished installing kumo 1.6"
  end

  def server_script(server_jar); <<-EOS.undent
    #!/bin/bash
    exec java -cp #{server_jar} com.kennycason.kumo.cli.KumoCli "$@"
  EOS
  end

  test do
    pipe_output("#{bin}/kumo --version", "Test Kumo version command")
  end
end