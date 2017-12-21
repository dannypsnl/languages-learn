const sleep = (param) => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve(param * param)
        }, 1000)
    })
}

async function print() {
    var res = await sleep(2)
    console.log(res)
}

print()
