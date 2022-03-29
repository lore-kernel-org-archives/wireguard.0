Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D43C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Apr 2022 23:48:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id fd3f40cc;
	Thu, 21 Apr 2022 23:48:50 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2a4781b7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Mar 2022 22:16:58 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id w7so14437190pfu.11
 for <wireguard@lists.zx2c4.com>; Tue, 29 Mar 2022 15:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Z0ZoM8F9YLls6bS0Q3l21Vfc/SzYM8qoFOFRoShumIo=;
 b=fxtyE1YFx48gx6iskBGUrWrOCITtKkF3+/1kWZ/ZyWdmtsXIRI4gWdDq8epQHLyM9z
 LmshgTAbglgvLXSwTV4W/wGaSWoRoJ6FM7pttLJ5dmHKZBbTqhZvmBbMsByPH0AldAlE
 YEOwogWQNNS/1DFIdzGdNWtJr3Cid2cL/x5UAwZFaToMYKba5s6i7J4aUY6H90rNN8of
 a8+1A1WThKf+RjcmZ3mBKEGYv3C2m70XBl5+iyJ1JAtWA3Exk8By0ooZDDRqthMpXLrl
 a/vMbVR7u17WXT/D92Db9cVfx35RB384tgbCPqHtBKDAylT7bDDRJiZQ/03HUuQEC8Es
 ODVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Z0ZoM8F9YLls6bS0Q3l21Vfc/SzYM8qoFOFRoShumIo=;
 b=QPOVyEC+JJ1krPq/ySQf1Sf0YsH9AHwiPOnoa1UX1jV9yYPhLMXotMnTCjFJndZM/O
 uZR7L6vM7kMR+62wn/Qoj9jvyDUE9tnIaOrl8XQAX8Z+kU2dVbkFgO7v5xxzq3iPTIcH
 JgO6ZG6QpEL80kAlX+B//Z9uKyKmM39+xH2Fo2gBZ78N+wyjufJAbolVDTLYdVjB/9Nx
 yIrWv8KHbeQIDnzYLdWivebNr3kC2snKlwaDielDiwrlYfkj8fv2uSIuG9E9OLrXHRNu
 fTYClDfYXIq4io9+Dd1i49jCBXvvgtgM5o8uEclU+1WPILgcMcReceD48ngGenCG0CXN
 RVZA==
X-Gm-Message-State: AOAM5305btFKTuU2a+JiOnbSGVIlPErIMn+RYVb4HiZqsw6P8tBQ+0Sp
 pwLkyWgqWpUD7WLah6CYt6Q9t0vzr3+KVYrEoV5L+M4g3XQ=
X-Google-Smtp-Source: ABdhPJzDSGbRPAb/oO3dobXLtupzRqw/az3SUifCVeiYcGh0bJrhfToQAAvApJlnbK3JslHb/snTCWWNnLVuBIBwilM=
X-Received: by 2002:a63:5756:0:b0:36c:67bc:7f3f with SMTP id
 h22-20020a635756000000b0036c67bc7f3fmr3584062pgm.389.1648592216320; Tue, 29
 Mar 2022 15:16:56 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Charles=2DFran=C3=A7ois_Natali?= <cf.natali@gmail.com>
Date: Tue, 29 Mar 2022 23:16:45 +0100
Message-ID: <CAH_1eM3ASzMSFcCrutjkP135G567JKdcb++2yMpVV3a-fTPodA@mail.gmail.com>
Subject: CPU round-robin and isolated cores
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:48:42 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi!

We've run into an issue where wireguard doesn't play nice with
isolated cores (`isolcpus` kernel parameter).

Basically we use `isolcpus` to isolate cores and explicitly bind our
low-latency processes to those cores, in order to minimize latency due
to the kernel and userspace.

It worked great until we started using wireguard, in particular it
seems to be due to the way work is allocated to the workqueues created here:
https://github.com/torvalds/linux/blob/ae085d7f9365de7da27ab5c0d16b12d51ea7fca9/drivers/net/wireguard/device.c#L335

I'm not familiar with the wireguard code at all so might be missing
something, but looking at e.g.
https://github.com/torvalds/linux/blob/ae085d7f9365de7da27ab5c0d16b12d51ea7fca9/drivers/net/wireguard/receive.c#L575
and https://github.com/torvalds/linux/blob/ae085d7f9365de7da27ab5c0d16b12d51ea7fca9/drivers/net/wireguard/queueing.h#L176
it seems that the RX path uses round-robin to dispatch the
packets to all online CPUs, including isolated ones:

```
void wg_packet_receive(struct wg_device *wg, struct sk_buff *skb)
{
[...]
    /* Then we queue it up in the device queue, which consumes the
    * packet as soon as it can.
    */
    cpu = wg_cpumask_next_online(next_cpu);
    if (unlikely(ptr_ring_produce_bh(&device_queue->ring, skb)))
        return -EPIPE;
    queue_work_on(cpu, wq, &per_cpu_ptr(device_queue->worker, cpu)->work);
    return 0;
}
```

Where `wg_cpumask_next_online` is defined like this:
```
static inline int wg_cpumask_next_online(int *next)
{
    int cpu = *next;

    while (unlikely(!cpumask_test_cpu(cpu, cpu_online_mask)))
        cpu = cpumask_next(cpu, cpu_online_mask) % nr_cpumask_bits;
    *next = cpumask_next(cpu, cpu_online_mask) % nr_cpumask_bits;
    return cpu;
}
```

It's a problem for us because it causes significant latency, see e.g.
this ftrace output showing a kworker - bound to an isolated core - spend over
240usec inside wg_packet_decrypt_worker - we've seen much higher, up to
500usec or even more:

```
kworker/47:1-2373323 [047] 243644.756405: funcgraph_entry: |
process_one_work() {
    kworker/47:1-2373323 [047] 243644.756406: funcgraph_entry: |
wg_packet_decrypt_worker() {
[...]
    kworker/47:1-2373323 [047] 243644.756647: funcgraph_exit: 0.591 us | }
    kworker/47:1-2373323 [047] 243644.756647: funcgraph_exit: ! 242.655 us | }
```

If it was for example a physical NIC, typically what we'd do would
be to set IRQ affinity to avoid those isolated cores, which would also
avoid running the corresponding softirqs on those cores, avoiding such
latency.

However it seems that there's currently no way to tell wireguard to
avoid those cores.

I was wondering if it would make sense for wireguard to ignore
isolated cores to avoid this kind of issue. As far as I can tell it should
be a matter of replacing usages of `cpu_online_mask` by
`housekeeping_cpumask(HK_TYPE_DOMAIN)` or even
`housekeeping_cpumask(HK_TYPE_DOMAIN | HK_TYPE_WQ)`.

We could potentially run with a patched kernel but would very much
prefer using an upstream fix if that's acceptable.

Thanks in advance!

Charles
