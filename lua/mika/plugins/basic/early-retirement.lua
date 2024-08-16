return {
	"chrisgrieser/nvim-early-retirement",
	config = true,
	event = "VeryLazy",
	opts = {
		retirementAgeMins = 10,
		minimumBufferNum = 3,
		ignoreUnsavedChangesBufs = false,
		ignoreSpecialBuftypes = true,
		ignoreVisibleBufs = true,
		ignoreUnloadedBufs = false,
		notificationOnAutoClose = true,
		deleteBufferWhenFileDeleted = true,
	},
}
