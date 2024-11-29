return {
	"chrisgrieser/nvim-early-retirement",
	config = true,
	event = { "BufEnter" },
	opts = {
		retirementAgeMins = 3,
		minimumBufferNum = 3,
		ignoreUnsavedChangesBufs = true,
		ignoreSpecialBuftypes = true,
		ignoreVisibleBufs = true,
		ignoreUnloadedBufs = true,
		notificationOnAutoClose = true,
		deleteBufferWhenFileDeleted = true,
	},
}
