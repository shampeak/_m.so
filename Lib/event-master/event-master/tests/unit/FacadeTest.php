<?php

namespace Fuel\Event\Facades;

use Codeception\TestCase\Test;

class FacadeTest extends Test
{

	public function _before()
	{
		Event::delete(true);
		Queue::delete(true);
	}

	public function testForgeContainer()
	{
		$container = Event::forge();

		$this->assertInstanceOf('Fuel\\Event\\Container', $container);
	}

	public function testForgeQueue()
	{
		$container = Queue::forge();

		$this->assertInstanceOf('Fuel\\Event\\Queue', $container);
	}

	public function testEventCallForewarding()
	{
		$result = Event::on('event', function(){});

		$this->assertInstanceOf('Fuel\\Event\\Container', $result);
	}

	public function testQueueCallForewarding()
	{
		$result = Queue::queue('event');

		$this->assertInstanceOf('Fuel\\Event\\Queue', $result);
	}

	public function testEventInstance()
	{
		$result = Event::instance('my_instance');

		$this->assertInstanceOf('Fuel\\Event\\Container', $result);
	}

	public function testDeleteQueueInstance()
	{
		$instance = Queue::instance('my_instance');
		$instance->queue('event', array(1, 2, 3));

		Queue::delete('my_instance');

		$instance = Queue::instance('my_instance');
		$payload = $instance->getPayload('event');

		$this->assertEquals($payload, array());
	}

}
