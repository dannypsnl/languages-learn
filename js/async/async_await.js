const sleep = (param) => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve(param * param)
        }, 1000)
    })
}

async function print() {
    let res = await sleep(2)
    console.log(res)
    res = await sleep(res)
    console.log(res)
    res = await sleep(res)
    console.log(res)
}

print()
