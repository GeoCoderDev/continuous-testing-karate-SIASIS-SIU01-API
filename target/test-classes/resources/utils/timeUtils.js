function fn() {
    return {
        getAdjustedTime: function() {
            var now = new Date();
            var adjustedTime = new Date(now.getTime() - (1 * 60 * 60 * 1000));
            return adjustedTime.toISOString();
        }
    };
}
