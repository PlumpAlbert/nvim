return {
	"chrisgrieser/nvim-early-retirement",
	config = true,
	event = { "BufEnter" },
	opts = {
		retirementAgeMins = 3,
		minimumBufferNum = 3,
		ignoreUnsavedChangesBufs = false,
		ignoreSpecialBuftypes = true,
		ignoreVisibleBufs = true,
		ignoreUnloadedBufs = false,
		notificationOnAutoClose = true,
		deleteBufferWhenFileDeleted = true,
	},
}
