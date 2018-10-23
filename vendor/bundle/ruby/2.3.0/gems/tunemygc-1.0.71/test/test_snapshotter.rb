# encoding: utf-8

require File.join(File.dirname(__FILE__), 'helper')

class TestSnapshotter < TuneMyGcTestCase
  def test_init
    snapshots = TuneMyGc::Snapshotter.new
    assert_equal 0, snapshots.size
  end

  def test_take
    snapshots = TuneMyGc::Snapshotter.new
    snapshots.take(:BOOTED)
    assert_equal 1, snapshots.size
    snapshots.clear
  end

  def test_clear
    snapshots = TuneMyGc::Snapshotter.new
    snapshots.take(:BOOTED)
    assert_equal 1, snapshots.size
    snapshots.clear
    assert_equal 0, snapshots.size
  end

  def test_max_samples
    snapshots = TuneMyGc::Snapshotter.new
    2000.times do |i|
      snapshots.take(:MAX)
    end
    assert_equal 2000, snapshots.size
    out, err = capture_io do
      TuneMyGc.logger = Logger.new($stdout)
      snapshots.take(:MORE)
      snapshots.take(:ANOTHER)
    end
    assert_match(/Discarding snapshot/, out)
    assert_equal 2000, snapshots.size
    snapshots.take(:TERMINATED)
    assert_equal 2001, snapshots.size
    snapshots.clear
  end
end