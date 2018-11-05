#include "ruby/ruby.h"
static VALUE sym_gc_stat[25];
static VALUE sym_latest_gc_info[5];
typedef struct {
    VALUE thread_id;
    double ts;
    size_t peak_rss;
    size_t current_rss;
    VALUE stage;
    size_t count;
    size_t heap_allocated_pages;
    size_t heap_sorted_length;
    size_t heap_allocatable_pages;
    size_t heap_available_slots;
    size_t heap_live_slots;
    size_t heap_free_slots;
    size_t heap_final_slots;
    size_t heap_marked_slots;
    size_t heap_eden_pages;
    size_t heap_tomb_pages;
    size_t total_allocated_pages;
    size_t total_freed_pages;
    size_t total_allocated_objects;
    size_t total_freed_objects;
    size_t malloc_increase_bytes;
    size_t malloc_increase_bytes_limit;
    size_t minor_gc_count;
    size_t major_gc_count;
    size_t remembered_wb_unprotected_objects;
    size_t remembered_wb_unprotected_objects_limit;
    size_t old_objects;
    size_t old_objects_limit;
    size_t oldmalloc_increase_bytes;
    size_t oldmalloc_increase_bytes_limit;
    VALUE major_by;
    VALUE gc_by;
    VALUE have_finalizer;
    VALUE immediate_sweep;
    VALUE state;
} tunemygc_stat_record;
static void
tunemygc_set_stat_record(tunemygc_stat_record *record)
{
    record->count = rb_gc_stat(sym_gc_stat[0]);
    record->heap_allocated_pages = rb_gc_stat(sym_gc_stat[1]);
    record->heap_sorted_length = rb_gc_stat(sym_gc_stat[2]);
    record->heap_allocatable_pages = rb_gc_stat(sym_gc_stat[3]);
    record->heap_available_slots = rb_gc_stat(sym_gc_stat[4]);
    record->heap_live_slots = rb_gc_stat(sym_gc_stat[5]);
    record->heap_free_slots = rb_gc_stat(sym_gc_stat[6]);
    record->heap_final_slots = rb_gc_stat(sym_gc_stat[7]);
    record->heap_marked_slots = rb_gc_stat(sym_gc_stat[8]);
    record->heap_eden_pages = rb_gc_stat(sym_gc_stat[9]);
    record->heap_tomb_pages = rb_gc_stat(sym_gc_stat[10]);
    record->total_allocated_pages = rb_gc_stat(sym_gc_stat[11]);
    record->total_freed_pages = rb_gc_stat(sym_gc_stat[12]);
    record->total_allocated_objects = rb_gc_stat(sym_gc_stat[13]);
    record->total_freed_objects = rb_gc_stat(sym_gc_stat[14]);
    record->malloc_increase_bytes = rb_gc_stat(sym_gc_stat[15]);
    record->malloc_increase_bytes_limit = rb_gc_stat(sym_gc_stat[16]);
    record->minor_gc_count = rb_gc_stat(sym_gc_stat[17]);
    record->major_gc_count = rb_gc_stat(sym_gc_stat[18]);
    record->remembered_wb_unprotected_objects = rb_gc_stat(sym_gc_stat[19]);
    record->remembered_wb_unprotected_objects_limit = rb_gc_stat(sym_gc_stat[20]);
    record->old_objects = rb_gc_stat(sym_gc_stat[21]);
    record->old_objects_limit = rb_gc_stat(sym_gc_stat[22]);
    record->oldmalloc_increase_bytes = rb_gc_stat(sym_gc_stat[23]);
    record->oldmalloc_increase_bytes_limit = rb_gc_stat(sym_gc_stat[24]);
    record->major_by = rb_gc_latest_gc_info(sym_latest_gc_info[0]);
    record->gc_by = rb_gc_latest_gc_info(sym_latest_gc_info[1]);
    record->have_finalizer = rb_gc_latest_gc_info(sym_latest_gc_info[2]);
    record->immediate_sweep = rb_gc_latest_gc_info(sym_latest_gc_info[3]);
    record->state = rb_gc_latest_gc_info(sym_latest_gc_info[4]);
}
static VALUE
tunemygc_get_stat_record(tunemygc_stat_record *record)
{
    VALUE stat = rb_ary_new2(25);
    VALUE latest_info = rb_hash_new();
    VALUE snapshot = rb_ary_new2(8);
    rb_ary_store(stat, 0, SIZET2NUM(record->count));
    rb_ary_store(stat, 1, SIZET2NUM(record->heap_allocated_pages));
    rb_ary_store(stat, 2, SIZET2NUM(record->heap_sorted_length));
    rb_ary_store(stat, 3, SIZET2NUM(record->heap_allocatable_pages));
    rb_ary_store(stat, 4, SIZET2NUM(record->heap_available_slots));
    rb_ary_store(stat, 5, SIZET2NUM(record->heap_live_slots));
    rb_ary_store(stat, 6, SIZET2NUM(record->heap_free_slots));
    rb_ary_store(stat, 7, SIZET2NUM(record->heap_final_slots));
    rb_ary_store(stat, 8, SIZET2NUM(record->heap_marked_slots));
    rb_ary_store(stat, 9, SIZET2NUM(record->heap_eden_pages));
    rb_ary_store(stat, 10, SIZET2NUM(record->heap_tomb_pages));
    rb_ary_store(stat, 11, SIZET2NUM(record->total_allocated_pages));
    rb_ary_store(stat, 12, SIZET2NUM(record->total_freed_pages));
    rb_ary_store(stat, 13, SIZET2NUM(record->total_allocated_objects));
    rb_ary_store(stat, 14, SIZET2NUM(record->total_freed_objects));
    rb_ary_store(stat, 15, SIZET2NUM(record->malloc_increase_bytes));
    rb_ary_store(stat, 16, SIZET2NUM(record->malloc_increase_bytes_limit));
    rb_ary_store(stat, 17, SIZET2NUM(record->minor_gc_count));
    rb_ary_store(stat, 18, SIZET2NUM(record->major_gc_count));
    rb_ary_store(stat, 19, SIZET2NUM(record->remembered_wb_unprotected_objects));
    rb_ary_store(stat, 20, SIZET2NUM(record->remembered_wb_unprotected_objects_limit));
    rb_ary_store(stat, 21, SIZET2NUM(record->old_objects));
    rb_ary_store(stat, 22, SIZET2NUM(record->old_objects_limit));
    rb_ary_store(stat, 23, SIZET2NUM(record->oldmalloc_increase_bytes));
    rb_ary_store(stat, 24, SIZET2NUM(record->oldmalloc_increase_bytes_limit));
    rb_hash_aset(latest_info, sym_latest_gc_info[0], record->major_by);
    rb_hash_aset(latest_info, sym_latest_gc_info[1], record->gc_by);
    rb_hash_aset(latest_info, sym_latest_gc_info[2], record->have_finalizer);
    rb_hash_aset(latest_info, sym_latest_gc_info[3], record->immediate_sweep);
    rb_hash_aset(latest_info, sym_latest_gc_info[4], record->state);
    rb_ary_store(snapshot, 0, DBL2NUM(record->ts));
    rb_ary_store(snapshot, 1, SIZET2NUM(record->peak_rss));
    rb_ary_store(snapshot, 2, SIZET2NUM(record->current_rss));
    rb_ary_store(snapshot, 3, record->stage);
    rb_ary_store(snapshot, 4, stat);
    rb_ary_store(snapshot, 5, latest_info);
    rb_ary_store(snapshot, 6, Qnil);
    rb_ary_store(snapshot, 7, record->thread_id);
    return snapshot;
}
static void
tunemygc_setup_trace_symbols(void)
{
    sym_gc_stat[0] = ID2SYM(rb_intern("count"));
    sym_gc_stat[1] = ID2SYM(rb_intern("heap_allocated_pages"));
    sym_gc_stat[2] = ID2SYM(rb_intern("heap_sorted_length"));
    sym_gc_stat[3] = ID2SYM(rb_intern("heap_allocatable_pages"));
    sym_gc_stat[4] = ID2SYM(rb_intern("heap_available_slots"));
    sym_gc_stat[5] = ID2SYM(rb_intern("heap_live_slots"));
    sym_gc_stat[6] = ID2SYM(rb_intern("heap_free_slots"));
    sym_gc_stat[7] = ID2SYM(rb_intern("heap_final_slots"));
    sym_gc_stat[8] = ID2SYM(rb_intern("heap_marked_slots"));
    sym_gc_stat[9] = ID2SYM(rb_intern("heap_eden_pages"));
    sym_gc_stat[10] = ID2SYM(rb_intern("heap_tomb_pages"));
    sym_gc_stat[11] = ID2SYM(rb_intern("total_allocated_pages"));
    sym_gc_stat[12] = ID2SYM(rb_intern("total_freed_pages"));
    sym_gc_stat[13] = ID2SYM(rb_intern("total_allocated_objects"));
    sym_gc_stat[14] = ID2SYM(rb_intern("total_freed_objects"));
    sym_gc_stat[15] = ID2SYM(rb_intern("malloc_increase_bytes"));
    sym_gc_stat[16] = ID2SYM(rb_intern("malloc_increase_bytes_limit"));
    sym_gc_stat[17] = ID2SYM(rb_intern("minor_gc_count"));
    sym_gc_stat[18] = ID2SYM(rb_intern("major_gc_count"));
    sym_gc_stat[19] = ID2SYM(rb_intern("remembered_wb_unprotected_objects"));
    sym_gc_stat[20] = ID2SYM(rb_intern("remembered_wb_unprotected_objects_limit"));
    sym_gc_stat[21] = ID2SYM(rb_intern("old_objects"));
    sym_gc_stat[22] = ID2SYM(rb_intern("old_objects_limit"));
    sym_gc_stat[23] = ID2SYM(rb_intern("oldmalloc_increase_bytes"));
    sym_gc_stat[24] = ID2SYM(rb_intern("oldmalloc_increase_bytes_limit"));
    sym_latest_gc_info[0] = ID2SYM(rb_intern("major_by"));
    sym_latest_gc_info[1] = ID2SYM(rb_intern("gc_by"));
    sym_latest_gc_info[2] = ID2SYM(rb_intern("have_finalizer"));
    sym_latest_gc_info[3] = ID2SYM(rb_intern("immediate_sweep"));
    sym_latest_gc_info[4] = ID2SYM(rb_intern("state"));
}