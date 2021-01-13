Return-Path: <SRS0=J4Yg=GQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3861C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 16:04:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 900DF233FC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 16:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 900DF233FC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e78507d;
	Wed, 13 Jan 2021 16:04:41 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [167.71.246.149])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d9fd9fd3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jan 2021 16:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1610553871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=NThuTBtGelW3xz168j8JZS2UFLf7qMM+gviovjXqTXY=;
 b=W70Tw4V5gYPwbLdwHHkJ2rE3tUkfzffSiVtZ8kNlvJXrtUuLyYRUcE5tc+atOAFrEtJfYW
 Js/sL0RcjKwdV0hNPGanV3fAxOdhnJGiPqyvA5uQrGVJo6SSams3DtOzkHjVGVxyUyl7ex
 C88aCw/yNOcQTP2MxK/nFYbdvBPw2SA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 001f6e06
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jan 2021 16:04:31 +0000 (UTC)
Date: Wed, 13 Jan 2021 17:04:29 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Subject: Userspace Networking Stack + WireGuard + Go
Message-ID: <X/8aDfdkod+rCPqK@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Hi,

Sometimes people say things like, "I want to make an application that
connects to the server over WireGuard" or "I want to host this service
application behind WireGuard" or "I want this small utility to initiate
an SSH connection to a specific server over WireGuard." The usual answer
to this is to simply bring up a WireGuard interface on the computer, and
then do networking as usual. And making WireGuard easy enough that
people can pull up ad-hoc interfaces trivially has been a big motivating
factor for the simplicity of the tooling, such as `ip link add wg0 type
wireguard && wg set wg0 ...` and similar commands.

On Linux, adding an interface is easy to do and is a solution that fits
nearly all circumstances. Even if you're unprivileged and want a
WireGuard interface for just a single application that's bound to the
lifetime of that application, you can still use WireGuard's normal
kernel interface inside of a user namespace + a network namespace, and
get a private process-specific WireGuard interface. Pretty cool stuff.
It's not like that's an accident, of course -- WireGuard was originally
developed with Linux's model in mind.

But not all operating systems are as neat as Linux. To that end, we've
tried very hard to make WireGuard integrate as natively as possible into
other operating systems, with native clients for every platform, as well
as APIs for every platform to allow application developers to embed
tunnels: https://www.wireguard.com/embedding/ . This is great and works
well. WireGuard's design centers around the "network interface" as the
central object, and that's what these libraries enable. But still, some
people do not want to think about network interfaces or operating
systems when writing code.

To that end, I've recently written some code that couples a userspace
networking stack (from gVisor) with a userspace WireGuard implementation
(from wireguard-go), along with a little custom DNS client
implementation, so that Go applications can use an in-process WireGuard
interface directly to make TCP and UDP connections and listeners. From
the operating system's point of view, the application just sends and
receives encrypted UDP packets, and never sees the inner TCP or UDP
packets or knows about WireGuard at all.

Here's a quick example of what's possible:

    package main

    import (
        "io"
        "log"
        "net"
        "net/http"

        "golang.zx2c4.com/wireguard/device"
        "golang.zx2c4.com/wireguard/tun"
    )

    func main() {
        tun, tnet, err := tun.CreateNetTUN(
            []net.IP{net.ParseIP("192.168.4.29")},
	    []net.IP{net.ParseIP("8.8.8.8")},
	    1420)
        if err != nil {
            log.Panic(err)
        }
        dev := device.NewDevice(tun, &device.Logger{log.Default(), log.Default(), log.Default()})
        dev.IpcSet(`private_key=a8dac1d8a70a751f0f699fb14ba1cff7b79cf4fbd8f09f44c6e6a90d0369604f
    public_key=25123c5dcd3328ff645e4f2a3fce0d754400d3887a0cb7c56f0267e20fbf3c5b
    endpoint=163.172.161.0:12912
    allowed_ip=0.0.0.0/0
    `)
        dev.Up()

        client := http.Client{
            Transport: &http.Transport{
                DialContext: tnet.DialContext,
            },
        }
        resp, err := client.Get("https://www.zx2c4.com/ip")
        if err != nil {
            log.Panic(err)
        }
        body, err := io.ReadAll(resp.Body)
        if err != nil {
            log.Panic(err)
        }
        log.Println(string(body))
    }

This snippet prints out:

    163.172.161.0
    demo.wireguard.com
    Go-http-client/1.1

, because that HTTPS request is going through the demo box.

Other use cases of this include cloud VM providers to bundle an ssh
client directly into their tooling that connects to a "cloud private
network" over WireGuard. Or hosting utilities that allow people to run
web apps from their own computers that are then accessible on the
Internet by connecting in reverse through WireGuard. Or maybe other use
cases.

The API and the code is new, and potentially incomplete. Please take it
for a spin and let me know your feedback.

Enjoy,
Jason

PS: While the gophers on the list might be happy about this, the
rustaceans may well be left wondering, "what about us?" I hope to have
some positive news about wireguard-rs not before too long.
