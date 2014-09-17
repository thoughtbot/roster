func dispatch_main_async(block: dispatch_block_t) {
    dispatch_async(dispatch_get_main_queue(), block)
}
