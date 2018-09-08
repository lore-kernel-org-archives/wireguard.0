Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 490cadc2
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:17:51 +0000 (UTC)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83bb6661
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:17:51 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v16-v6so17518393wro.11
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 07:18:20 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
Subject: Re: [PATCH 6/7] tools: allow setting of transit net
To: Aaron Jones <aaronmdjones@gmail.com>
References: <20180908121841.8372-1-ju.orth@gmail.com>
 <20180908121841.8372-7-ju.orth@gmail.com>
 <58f22c10-24ba-91a7-2d7e-2d9fc3b50565@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
Message-ID: <ae953bd6-eb42-647b-1b1a-8de8e0e0bb15@gmail.com>
Date: Sat, 8 Sep 2018 16:18:18 +0200
MIME-Version: 1.0
In-Reply-To: <58f22c10-24ba-91a7-2d7e-2d9fc3b50565@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 9/8/18 4:09 PM, Aaron Jones wrote:
> On 08/09/18 12:18, Julian Orth wrote:
>> +static bool parse_transit_net(struct wgdevice *device, const char *arg)
>> +{
>> +	/* U32 arg -> PID */
>> +	if (isdigit(*arg)) {
>> +		char *end;
>> +		unsigned long pid = strtoul(arg, &end, 10);
>> +		if (!*end && pid <= UINT32_MAX) {
> 
> This condition will always be true on a 32-bit system (for a valid
> integer). I'd prefer strtoull() and `unsigned long long' but given
> that a valid file descriptor won't ever go that high... eh. shrug. But
> you'll still get a compiler diagnostic for it.

Even with clang's -Weverything I don't get a warning when I compile the 
following:

#include <stdint.h>

int f(unsigned int i);

int f(unsigned int i)
{
	return i <= UINT32_MAX;
}

I don't see why it would be different for unsigned long on a 32-bit system.
