Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef304a21
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 13:49:15 +0000 (UTC)
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com
 [IPv6:2a00:1450:400c:c09::242])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9959c331
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 13:49:15 +0000 (UTC)
Received: by mail-wm0-x242.google.com with SMTP id b19-v6so17251660wme.3
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 06:49:44 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
Subject: Re: [PATCH 0/7] Allow changing the transit namespace
To: Bruno Wolff III <bruno@wolff.to>
References: <20180908121841.8372-1-ju.orth@gmail.com>
 <20180908133906.GA20780@wolff.to>
From: Julian Orth <ju.orth@gmail.com>
Message-ID: <a2392424-95eb-bd6a-a82e-39a2167a9902@gmail.com>
Date: Sat, 8 Sep 2018 15:49:41 +0200
MIME-Version: 1.0
In-Reply-To: <20180908133906.GA20780@wolff.to>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 9/8/18 3:39 PM, Bruno Wolff III wrote:
> On Sat, Sep 08, 2018 at 14:18:34 +0200,
>   Julian Orth <ju.orth@gmail.com> wrote:
>>
>> wg set <device> transit-net <pid|file-path>
>>
>> The distinction is made based on the format of the argument. If it is an
>> unsigned 32 bit integer, then it is interpreted as a process id.
>> Otherwise it is interpreted as a file path. /proc does not need to be
>> mounted to use the process id interpretation. To force the
>> interpretation as a file-path, use a ./ prefix.
> 
> Ambiguity is generally not a good idea (especially for security 
> applications). It's not my decision, but I'd rather see the syntax make 
> it clear what the type of the parameter is supposed to be.

The syntax is based on a similar feature in iproute2:

ip link set <device> netns <pid|name>

The syntax of wg seems to generally follow the iproute2 syntax so I 
tried to keep it consistent.
