Return-Path: samuel@sholland.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7826f663
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Mar 2018 16:06:57 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82a0c756
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Mar 2018 16:06:57 +0000 (UTC)
Subject: Re: Lineage OS (Android) Support
To: Paul <paul@makrotopia.org>, wireguard@lists.zx2c4.com
References: <1520793735.1523.0@mail.makrotopia.org>
 <1520939702.663.1@mail.makrotopia.org>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <445be82a-7c57-4661-c3fc-7ad79d42f6ea@sholland.org>
Date: Thu, 15 Mar 2018 11:17:26 -0500
MIME-Version: 1.0
In-Reply-To: <1520939702.663.1@mail.makrotopia.org>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

On 03/13/18 06:15, Paul wrote:
> On So, Mär 11, 2018 at 7:42 PM, Paul <paul@makrotopia.org> wrote:
>> Hi all,
>>
>> I'm new to the list and hope this wasn't discussed in length here before. If
>> so, please give me a direction, I couldn't find anything related.
>>
>> For the last days I tried to find a Lineage OS [1] compatible kernel with
>> wireguard included, sadly there is none. Instead of installing a custom
>> kernel, could Lineage include the < 4000 lines of code in their build root?
>> Have there been any efforts on this?
>>
>> Thank you very much for all further information.
>>
>> Best regards,
>> Paul Spooren
>>
>> [1] http://lineageos.org/
> 
> I asked the Lineage OS maintainer of my current phone and he responded to use
> the native VPN interface of Android. Are there any plans on that?

Yes, support for using the Go implementation[1] with VpnService is in the works.
The same app will support both the native and userspace implementations. It will
prefer the native implementation if root access and the kernel module are
available, and fall back to using VpnService otherwise.

>> https://developer.android.com/reference/android/net/VpnService.html
>>
>> That has many pros:
>> 1. runs on any Android 4.0+ device (NO root required)
>> 2. all VPN code (except network interface of course) is running in userspace
>> (in case of exploitation only VPN app is compromised)
>> 3. decoupled from OS and easy to upgrade

Using the native implementation has its own benefits. It will generally be
faster and more battery-efficient, and it supports having multiple tunnels up
simultaneously. VpnService only allows one VPN to be active at a time.

> Thanks for all further information!
> 
> Best,
> Paul

Regards,
Samuel

[1]: https://git.zx2c4.com/wireguard-go/
