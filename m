Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ec722a6
 for <wireguard@lists.zx2c4.com>; Wed, 2 Aug 2017 12:13:36 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 632491b4
 for <wireguard@lists.zx2c4.com>; Wed, 2 Aug 2017 12:13:36 +0000 (UTC)
Date: Wed, 2 Aug 2017 07:29:35 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: Re: Compile time assertion failure
Message-ID: <20170802122935.GA21536@wolff.to>
References: <20170802121920.GA3119@wolff.to> <20170802122430.GA11203@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <20170802122430.GA11203@wolff.to>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Aug 02, 2017 at 07:24:30 -0500,
  Bruno Wolff III <bruno@wolff.to> wrote:
>The problem seems to have been triggered by a recent (in the last few 
>commits) rather than by a change to the Fedora kernel.

It starts happening with the following commit:

commit 18fe2082601b79cb27936b5910d2ef36cc94d5d3 (HEAD -> master)
Author: Jason A. Donenfeld <Jason@zx2c4.com>
Date:   Tue Aug 1 22:47:26 2017 +0200

    routingtable: demand optimization
