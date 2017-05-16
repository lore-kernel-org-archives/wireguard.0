Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67dd3241
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 19:15:38 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ca074b8
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 19:15:38 +0000 (UTC)
Received: from [172.22.213.17] (global-184-110.nat-1.net.cam.ac.uk
 [131.111.184.110])
 by mail.thalheim.io (Postfix) with ESMTPSA id 0535F696EF
 for <wireguard@lists.zx2c4.com>; Tue, 16 May 2017 19:26:54 +0000 (UTC)
Subject: Re: Text-based IPC for Userspace Implementations
To: wireguard@lists.zx2c4.com
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <87vap1gd2w.fsf@alrua-kau>
 <358B5193-8D9F-472F-8202-B81BAA022FDD@titanous.com>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <1500fe21-c423-b34d-adf5-463b5d483cbf@higgsboson.tk>
Date: Tue, 16 May 2017 20:26:53 +0100
MIME-Version: 1.0
In-Reply-To: <358B5193-8D9F-472F-8202-B81BAA022FDD@titanous.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 2017-05-16 17:01, Jonathan Rudenberg wrote:
>> On May 16, 2017, at 09:12, Toke Høiland-Jørgensen <toke@toke.dk> wrote:
>>
>> So why not avoid any possible confusion and just emit JSON? Or another
>> well-established serialisation format where the nesting can be made
>> explicit... :)
> +1 to this, requiring implementors to also implement a custom serialization format will lead to avoidable bugs.
>
> I took a quick look and there is a bit of precedent for the use of JSON in the kernel tree: https://github.com/torvalds/linux/tree/3401e8d1e1300742ed41910b9338b9da52689a16/tools/perf/pmu-events
>
> Jonathan

For the kernel, netlink will be used, which is already does its own serialization format. The use of JSON here, would not make sense here.
